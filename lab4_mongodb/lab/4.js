db.getCollection('student').insert({
    "first_name": "Tomasz",
    "last_name": "Zawadzki",
    "attendance": true,
    "lab_grade": null,
    "current_date": new Date(),
    "subjects": [
        "TAiJF",
        "TOiZO",
        "Bazy danych"
    ]
})