function addReview(user_id, review_id, stars, text, business_id) {
    db.review.insert({
        votes: {
            funny: 0,
            useful: 0,
            cool: 0
        },
        user_id: user_id,
        review_id: review_id,
        stars: stars,
        date: ISODate(),
        text: text,
        type: 'review',
        business_id: business_id
    });
}

addReview(
    'qtrmBGNqCvupHMHL_bKFgQ',
    '9uHzyOu5CTCPl1q6cfvO7u',
    5.0,
    'Tasty burgers!',
    'vcNAWiLM4dR7D2nwwJ7nCA'
)

db.review.find({
    review_id: '9uHzyOu5CTCPl1q6cfvO7u'
})
    