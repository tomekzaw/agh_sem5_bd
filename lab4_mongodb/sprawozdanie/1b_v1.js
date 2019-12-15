db.review.find({
    'date': {
        $gte: '2011-'
    }
}).count()