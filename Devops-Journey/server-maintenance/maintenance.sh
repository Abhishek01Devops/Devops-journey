#!/bin/bash

# ── Config ────────────────────────────────────────────────────────────────────
LOGFILE="maintenance.log"
BACKUP_DIR="backup"
SOURCE_DIR="$HOME/Documents"
LOG_RETENTION_DAYS=7
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Helpers ───────────────────────────────────────────────────────────────────
log() { echo "$1" >> "$LOGFILE"; }
log_section() { log ""; log "=== $1 ==="; }
die() { echo "FATAL: $1" >&2; exit 1; }

# ── Init ──────────────────────────────────────────────────────────────────────
log "================================="
log "Server Maintenance Run: $(date)"
log "================================="

# ── Disk usage ────────────────────────────────────────────────────────────────
log_section "Disk Usage"
df -h / >> "$LOGFILE" || log "WARNING: df failed"

# ── Memory usage ──────────────────────────────────────────────────────────────
log_section "Memory Usage"
if command -v vm_stat &>/dev/null; then          # macOS
    vm_stat >> "$LOGFILE"
elif [[ -r /proc/meminfo ]]; then                # Linux
    cat /proc/meminfo >> "$LOGFILE"
else
    log "WARNING: No supported memory tool found"
fi

# ── CPU usage ─────────────────────────────────────────────────────────────────
log_section "CPU Usage"
if command -v top &>/dev/null; then
    # -l 1 is macOS-specific; Linux top needs -bn1
    if top --version 2>&1 | grep -q "procps"; then
        top -bn1 | head -10 >> "$LOGFILE"        # Linux
    else
        top -l 1 | head -10 >> "$LOGFILE"        # macOS
    fi
else
    log "WARNING: top not found"
fi

# ── Log cleanup ───────────────────────────────────────────────────────────────
log_section "Log Cleanup"
# Scoped to SCRIPT_DIR — avoids deleting unrelated .log files on the system
deleted=$(find "$SCRIPT_DIR" -name "*.log" -mtime +"$LOG_RETENTION_DAYS" -print -delete 2>/dev/null | wc -l | tr -d ' ')
log "Removed $deleted log file(s) older than ${LOG_RETENTION_DAYS} days"

# ── Backup ────────────────────────────────────────────────────────────────────
log_section "Backup"
[[ -d "$SOURCE_DIR" ]] || die "Source directory not found: $SOURCE_DIR"
mkdir -p "$BACKUP_DIR"  || die "Cannot create backup dir: $BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/home-backup-$(date +%Y-%m-%d-%H-%M).tar.gz"
if  tar -czf "$BACKUP_FILE" -C "/" "${SOURCE_DIR#/}" 2>>"$LOGFILE"; then
    SIZE=$(du -sh "$BACKUP_FILE" | cut -f1)
    log "Backup completed → $BACKUP_FILE ($SIZE)"
else
    log "ERROR: Backup failed — see above for tar output"
    exit 1
fi

log ""
log "Maintenance finished: $(date)"
