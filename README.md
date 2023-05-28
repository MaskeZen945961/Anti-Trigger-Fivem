# MaskeZen

This code snippet demonstrates an event configuration system for a game server script, intended for use with GitHub. The configuration allows for fine-grained control over who can use a specific event and what actions should be taken when the event is triggered.

The configuration parameters are as follows:

- `onlystaff`: A boolean value that determines whether only staff members can use this event. If set to `true`, only staff members will be able to trigger the event. If set to `false`, all players can use the event.

- `joballowed` and `job2allowed`: These parameters allow you to restrict the event usage to specific player jobs. If a job name is specified for `joballowed`, only players with that job will be able to trigger the event. `job2allowed` functions in the same way but for a different job. Setting these parameters to `nil` allows all players to use the event regardless of their job.

- `kick` and `ban`: These parameters determine whether the player should be kicked or banned if they use the event. If `kick` is set to `true`, the player will be kicked, while if `ban` is set to `true`, the player will be banned. Setting them to `false` means no action will be taken.

- `notif`: A boolean value indicating whether a notification should be displayed to the player if they use the event. If `true`, a notification will be shown; if `false`, no notification will be displayed.

- `coord`: This parameter specifies the coordinates at which the player must be present to use the event. If the player is not at these coordinates, the event will not be triggered. Setting it to `nil` means the player can use the event from anywhere.

- `reason`: A string that represents the reason for kicking or banning the player if they use the event. This reason will be displayed to the player or stored in the ban record.

Additionally, the code includes an event handler that listens for the event named 'eventName'. When the event is triggered, the code performs various checks based on the provided configuration. If the checks pass, the event logic is executed, and the player may be kicked or banned depending on the configuration. The code also includes checks for the availability of the SqlBan plugin and handles the ban accordingly.

No one is allowed to sell resources with Anti Trigger. Necessary actions will be taken if this is the case. Thank you for respecting my work.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
©Copyright MaskeZen
