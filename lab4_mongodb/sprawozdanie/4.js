function changeUserName(_id, new_name) {
    db.user.update(
        { _id: _id },
        { $set: { name: new_name }}
    )
}
            
object_id = ObjectId('5df65e24ee88e9f838d5cbf2')
changeUserName(object_id, 'Tomek')

db.user.find({ _id: object_id })