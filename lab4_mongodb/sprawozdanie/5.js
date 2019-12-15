db.tip.mapReduce(
    function() {
        emit(this.business_id, 1);
    },
    function(business_id, tips) {
        return tips.length;
    },
    {
        out: 'business_tips_count'
    }
)
    
db.business_tips_count.aggregate([
    {
        $group: {
            _id: null,
            avg: {
                $avg: '$value'
            }
        }
    }
])