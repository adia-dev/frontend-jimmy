import { add } from "../src/utils";

describe("testing utils file", () => {
  test("add 0 and 0 should result in zero", () => {
    expect(add(0, 0)).toBe(0);
  });
});
