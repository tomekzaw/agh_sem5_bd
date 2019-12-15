db.getCollection('business').aggregate([
    {$match: {categories: {$in: ["Restaurants"]}}},
    {$project: {name: 1, city: 1}},
    {$group: {_id: "$city", count: {$sum: 1}}},
    {$sort: {"count": -1}},
])