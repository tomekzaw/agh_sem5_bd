db.user.find({
    $or: [
        {'votes.funny': 0},
        {'votes.useful': 0}
    ]
}).sort({
    name: 1
})