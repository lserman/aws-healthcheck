### AWS Healthcheck

This gem defines a route in your Rails app for ELB healthchecks. The healthcheck is a piece of Rack middleware that does absolutely nothing, so it is faster than just using the default "/" route.

```ruby
gem 'aws-healthcheck'
```

Your Rails app now returns a 200 from `/healthcheck`.

If `ENV['GIT_COMMIT']` is set, the response will also include that value in the body:

```
{ "commit": "abcdef123456" }
```
