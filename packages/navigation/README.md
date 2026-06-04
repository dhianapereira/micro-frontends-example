# Navigation

`navigation` contains the router setup used by the shell app.

Micro apps expose their routes through the `MicroApp` contract. The shell app owns the `/` root route and composes micro app routes through `AppRouter`.

GoRouter is an implementation detail inside this package. Other packages use the workspace contracts instead of importing GoRouter directly.
