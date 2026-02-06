# Ticket-002 — Printer Offline / Jobs Not Printing

## User report
“I tried to print a document, but nothing happens. The printer shows idle, but it won’t print.”

## Environment
- OS: Windows 11
- Connection: Local printer
- User type: Standard user
- Apps involved: Notepad / general print services

## Impact / urgency
- Impact: User unable to print documents
- Urgency: Medium

## Initial triage questions
1. Is the printer powered on and connected?
2. Does the issue affect all applications?
3. Has the printer worked previously on this device?
4. Are there any recent system changes or updates?

## Working hypotheses (top 3)
1. Print Spooler service stopped or unresponsive
2. Stuck or corrupt print queue
3. Printer driver communication issue

## Actions taken (chronological)
1. Attempted to open printer queue; UI failed to load
2. Checked Print Spooler service status
3. Confirmed Print Spooler service was stopped
4. Attempted to print a test page, which failed

## Evidence collected
### Screenshots
- [Failed print attempt](./evidence/screenshots/print_attempt_failed.png)
- [Printer status shown as Idle during failure](./evidence/screenshots/printer_idle_during_failure.png)

*Note*: Printer status displayed as “Idle” during the failure; however, print attempts did not process due to the Print Spooler service being stopped.*

### Relevant logs
- [`spooler_status_stopped.txt`](./evidence/logs/spooler_status_stopped.txt)
- [`spooler_running.txt`](./evidence/logs/spooler_running.txt)


## Resolution
- Root cause: Print Spooler service was stopped, preventing print jobs from processing.
- Fix implemented: Restarted the Print Spooler service to clear stale state and reinitialize printer bindings.

## Validation
- Print Spooler service confirmed running.
- Printer returned to Idle state.
- Test print processes successfully.

## Prevention / follow-up
- Verify Print Spooler service status before troubleshooting drivers or ports.

## User-facing closeout message
“The printer wasn’t processing jobs because a background print service had stopped. I restarted the service and verified that printing is working again. Please try your document now and let us know if you see any further issues.”


