db.business.find({
    'open': false
}, {
    name: 1,
    full_address: 1,
    stars: 1
})