const db = require('../data/dbConfig.js');

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db("schemes");
};

function findById(scheme_id) {
  if (scheme_id) {
    return db("schemes")
      .where("id", scheme_id)
      .first();
  } else {
    return null;
  }
};

function findSteps(scheme_id) {
  console.log(`findSteps(${scheme_id})`);
  if (scheme_id) {
    return db("steps as st")
      .join("schemes as sc", "sc.id", "st.id")
      .select("st.id", "sc.scheme_name", "st.step_number", "st.instructions")
      .where("st.scheme_id", scheme_id);
  } else {
    return null;
  }
};

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(ids => this.findById(ids[0]));
    // .then(([id]) => this.findById(id));
};

function update(changes, id) {
  return db("schemes")
    .where("id", id)
    .update(changes)
    .then(count => (count > 0 ? this.findById(id) : null));
};

function remove(id) {
  if (id) {
    return db("schemes")
      .where("id", id)
      .del();
  } else {
    return null;
  }
};
