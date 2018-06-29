# PROMETHEUS ALERTMANAGER

The [Prometheus Alertmanager](https://prometheus.io/docs/alerting/alertmanager/) is a component that groups alerts, reliably deduplicates, and sends the grouped alerts as notifications. [Default config](https://prometheus.io/docs/alerting/alertmanager/).

Alerts firing on https://dash.k8s.gmantra.net/prometheus/alerts are sent as notifications to groups based on *severity*.

No notification is sent for DeadMansSwitch Alert.

## Severity: Warning

Alerts are sent on Ryver via Donbot and on Mobile via Pushover app.

### [Webhook](https://webhooks.pbworks.com/w/page/13385124/FrontPage)
HTTP POST request is sent on Ryver via url: https://hackcave.ryver.com/application/webhook/qrcBZQGFJO4cna6. 
[Configuration](https://prometheus.io/docs/alerting/configuration/#%3Cwebhook_config%3E), and the JSON format of the post request.

### [Pushover](https://pushover.net/)
Alerts must be sent through an application registered on the user's account, and the app's token will be used.
Multiple devices can be linked to a single account's User Key. Groups can be made with User key(s), and their devices.
If the user want's the notification to be sent to all devices linked to the user, then a group need not be created and the User key can be used directly instead of the group key.
Detailed [API](https://pushover.net/api).

## Severity: Warning

Alerts are sent only on Ryver through the same route as that of critical notification.

