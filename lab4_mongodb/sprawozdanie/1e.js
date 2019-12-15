db.tip.aggregate([
    {
        $match: {
            'date': {
                $regex: '^2012-'
            }
        }
    },
    {
        $group: {
            _id: '$business_id',
            count: {
                $sum: 1
            }
        },
    },
    {
        $lookup: {
            from: 'business',
            localField: '_id',
            foreignField: 'business_id',
            as: 'business_info'
        }
    },
    {
        $unwind: '$business_info'
    },
    {
        $project: {
            name: '$business_info.name',
            count: '$count'
        }
    },
    {
        $sort: {
             count: 1
        }
    }
])