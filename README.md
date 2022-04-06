<p align="center">
    <a href="https://sentry.io" target="_blank" align="center">
        <img src="https://sentry-brand.storage.googleapis.com/sentry-logo-black.png" width="280">
    </a>
</p>

_Bad software is everywhere, and we're tired of it. Sentry is on a mission to help developers write better software faster, so we can get back to enjoying technology. If you want to join us [<kbd>**Check out our open positions**</kbd>](https://sentry.io/careers/)_

# Sentry AWS Lambda Extension

AWS Lambda Extension for instrumenting Lambda functions.

## Getting help/support

If you need help setting up or configuring the Python SDK (or anything else in the Sentry universe) please head over to the [Sentry Community on Discord](https://discord.com/invite/Ww9hbqr). There is a ton of great people in our Discord community ready to help you!

## How the Sentry Lambda extension works

```mermaid
sequenceDiagram
    participant AWS Lambda Service
    participant Lambda Function
    participant Sentry Lambda Extension
    participant relay

    AWS Lambda Service->>Sentry Lambda Extension: init
    Sentry Lambda Extension->>relay: start
    Sentry Lambda Extension->>AWS Lambda Service: HTTP POST /register (invoke/shutdown)
    Sentry Lambda Extension->>AWS Lambda Service: HTTP GET /next

    AWS Lambda Service->>Lambda Function: invoke
    AWS Lambda Service->>Sentry Lambda Extension: invoke
    Lambda Function->>relay: send envelope
    Lambda Function->>relay: send transaction
    Lambda Function->>relay: send error
    Lambda Function-->>AWS Lambda Service: function invocation end

    Sentry Lambda Extension->>AWS Lambda Service: HTTP GET /next
    AWS Lambda Service->>Lambda Function: invoke
    AWS Lambda Service->>Sentry Lambda Extension: invoke
    Lambda Function->>relay: send error
    Lambda Function-->>AWS Lambda Service: function invocation end

    AWS Lambda Service->>Sentry Lambda Extension: shutdown
    Sentry Lambda Extension->>relay: shutdown
    relay-->>Sentry Lambda Extension: relay execution end
    Sentry Lambda Extension-->>AWS Lambda Service: extension execution end
```

## Resources

- [![Documentation](https://img.shields.io/badge/documentation-sentry.io-green.svg)](https://docs.sentry.io/quickstart/)
- [![Discord](https://img.shields.io/discord/621778831602221064)](https://discord.gg/Ww9hbqr)
- [![Stack Overflow](https://img.shields.io/badge/stack%20overflow-sentry-green.svg)](http://stackoverflow.com/questions/tagged/sentry)
- [![Twitter Follow](https://img.shields.io/twitter/follow/getsentry?label=getsentry&style=social)](https://twitter.com/intent/follow?screen_name=getsentry)

## License

Licensed under the BSD license, see [`LICENSE`](LICENSE)
