# GET /activities

Returns activities for one or multiple users.

## Resource URL
`<base-url>/activities`

## Query Params

The following parameters filter the data. If any of these parameters isn't defined the data isn't filtered. E.g. if no `user_ids` are given, activities of all users are returned.

| Name            | Type                   | Examples      | Description                                                   |
|-----------------|------------------------|---------------|---------------------------------------------------------------|
| user_ids        | Comma separated values | 1,2,3       | Only returns activities of the given users                    |
| start_time_from | Time                   | 1514761200000 | Only return activities, which started at this time or later   |
| start_time_to   | Time                   | 1514761200000 | Only return activities, which started at this time or earlier |
| type            | String                 | running       | Only return activities with this type                         |


## Example Request
`GET <base-url>/activities?type=running&user_ids=1`

## Example Response

### 200 OK

```json
[
    {
        "id": "321",
        "type": "running",
        "user_id": "1",
        "start_time": 1538483803000,
        "distance": 5000,
        "duration": 1500000
    }
]

```

### 400 Bad Request

```json
{
  "error": 400,
  "message": "..."
}

```

### 500 Internal Server Error

```json
{
  "error": 500,
  "message": "..."
}

```