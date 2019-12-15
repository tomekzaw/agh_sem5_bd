db.review.aggregate([
    {
        $match: {
            stars: {
                $gte: 4.0
            }
        }
    },            
    {
        $group: {
            _id: '$business_id',
            avg: {
                $avg: '$stars'
            }
        }
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
            avg: '$avg'
        }
    },
])