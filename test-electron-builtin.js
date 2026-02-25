// Test electron builtin from outside dashboard-app
console.log("Testing from:", __dirname);
console.log("Electron version:", process.versions.electron);
try {
  const e = require("electron");
  console.log("require(electron) type:", typeof e);
  if (typeof e === "object") {
    console.log("Keys:", Object.keys(e).slice(0, 5));
  }
} catch (err) {
  console.log("Error:", err.message);
}
