// async function test() {
//   return "test";
// }
// const t1 = test();
// t1.then((data) => console.log(data));

//await t1; - inpossible!

async function getData() {
  try {
    //const res = fetch("ht://randomuser.me/api/?results=2").then()
    const res = await fetch("ht://randomuser.me/api/?results=2");
    //const data = res.json().then()
    const data = await res.json();
    return data;
  } catch (error) {
    console.log("!!!!!!!getData!!!!!!!");
  }
}
async function workWithUser() {
  try {
    const users = await getData();
    console.log(users);
    return;
  } catch (error) {
    console.log("!!!!!!!!workWithUser!!!!!!");
  }
}
workWithUser();
