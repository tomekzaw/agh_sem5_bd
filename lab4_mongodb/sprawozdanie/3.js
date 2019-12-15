function findBusinessByCategory(feature) {
    return db.business.find({
        categories: {
            $in: [feature]
           }
    })
}

findBusinessByCategory('Restaurants')