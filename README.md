# PharoEDA Settings

This project provides a way to show and manage EDAApplications' and PharoEDA adapters' settings using the standard Pharo tool: Settings Browser.

## Motivation

Managing PharoEDA applications easily from within the Settings Browser can be useful. It can provide a way to list them, and modify which adapters it uses.
Additionally, it allows managing the configuration of each adapter.

## Design

PharoEDA-Settings use PharoEDA to access the information regarding the current applications, and also the adapters published by [PharoEDA-Adapters](https://github.com/rydnr/pharo-eda-adapters "PharoEDA-Adapters").
The design is centered around a single class, `EDASettings`.

## Usage

Load it with Metacello:

```smalltalk
Metacello new repository: 'github://rydnr/pharo-eda-settings:main'; baseline: #PharoEDASettings; load
```

Then, launch `SettingBrowser`

```smalltalk
SettingBrowser open
```

## Work in progress

- Refactor PharoEDA settings.

## Credits

- Background of the Pharo image by <a href="https://pixabay.com/photos/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=498202">Free-Photos</a> from <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=498202">Pixabay</a>.
