#[macro_use] extern crate rocket;

#[get("/healthz")]
fn healthz() -> &'static str {
    "OK"
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![healthz])
}
