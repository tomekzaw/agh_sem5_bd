db.review.aggregate([
    {
        $project: {
            date: {
                $dateFromString: {
                    dateString: '$date'
                }
            }
        }
    },
    {
        $match: {
            date: {
                $gte: ISODate('2011-01-01T00:00:00.000Z')
            }
        }
    },
    {
        $count: 'count'
    },
])