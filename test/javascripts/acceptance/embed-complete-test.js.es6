import { acceptance } from "discourse/tests/helpers/qunit-helpers";

acceptance("embed-complete", { loggedIn: true });

test("embed-complete works", async assert => {
  await visit("/admin/plugins/embed-complete");

  assert.ok(false, "it shows the embed-complete button");
});
