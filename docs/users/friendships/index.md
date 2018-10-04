# GET /users/:user_id/friendships

Returns all friends of a user.

## Resource URL
`<base-url>/users/:user_id/friends`

## Url Params

| Name    | Type   | Examples | Description                             |
|---------|--------|----------|-----------------------------------------|
| user_id | String | 123      | User for whom the friends are requested |


## Example Request
`GET <base-url>/users/1/friendships`

## Example Response

### 200 OK

```json
[
    {
        "id": "1",
        "user_ids": [
            "1",
            "2"
        ],
        "created_at": 1538567930000
    }
]

```

### 500 Internal Server Error

```json
{
  "error": 500,
  "message": "..."
}

```