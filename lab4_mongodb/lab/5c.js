db.getCollection('business').aggregate([
    {$match: {
        categories: {$in: ["Hotels"]},
        stars: {$gte: 4.5},
        "attributes.Wi-Fi": "free",
    }},
    {$project: {state: 1, count: 1}},
    {$group: {_id: "$state", count: {$sum: 1}}},
    {$sort: {"count": -1}},
])