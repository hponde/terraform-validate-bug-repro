# terraform-validate-bug-repro
Example of bug around "terraform validate"

## Steps

Steps to reproduce:

- Have terraform version `1.1.7` (latest, also known to repro in `0.15.5`)
- Git clone this repo
- Run `terraform init` (this sets up terraform state)
- According to the validation logic around `password_expiry` the value of `"2020-08-01T20:00:00Z"` should fail since it's so much in the past.
- `terraform validate` does not catch this:

```
❯ terraform validate
Success! The configuration is valid.
```

- `terraform console` does catch this and prints it out as an error:

```
❯ terraform console
╷
│ Warning: Due to the problems above, some expressions may produce unexpected results.
│
│
╵

╷
│ Error: Invalid value for variable
│
│   on main.tf line 10, in module "ci-service-account":
│   10:   password_expiry = "2020-08-01T20:00:00Z"
│
│ 'password_expiry' must be ISO 8601 datetime and at least one must be valid for the next 30 days.
│
│ This was checked by the validation rule at service-account/main.tf:4,3-13.
╵

>
```
