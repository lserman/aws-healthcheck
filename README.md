### AWS Healthcheck

This gem defines a route in your Rails app for ELB healthchecks. The healthcheck does absolutely nothing, so it is faster than just using the default "/" route.

```ruby
gem 'aws-healthcheck'
```

Your Rails app now returns a 200 from `/healthcheck`.
