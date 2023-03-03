local lu = require("luaunit")
local shexpand = require("shexpand")

function TestBasic()
	lu.assertItemsEquals(shexpand.expand("a.{js,ts}"), { "a.js", "a.ts" })
	lu.assertItemsEquals(
		shexpand.expand("foo.{test,spec}.ts"),
		{ "foo.test.ts", "foo.spec.ts" }
	)
end

function TestMultipleExpansions()
	lu.assertItemsEquals(shexpand.expand("hi.{spec,test}.{js,ts}"), {
		"hi.spec.js",
		"hi.spec.ts",
		"hi.test.js",
		"hi.test.ts",
	})
end

function TestEmptyExpansion()
	lu.assertItemsEquals(shexpand.expand("foo.gz{,ip}"), {
		"foo.gz",
		"foo.gzip",
	})
end

function TestEntireString()
	lu.assertItemsEquals(shexpand.expand("{js,cjs,mjs}"), {
		"js",
		"cjs",
		"mjs",
	})
end

function TestNonAlpha()
	lu.assertItemsEquals(shexpand.expand("foo.{1,++,my-thing}"), {
		"foo.1",
		"foo.++",
		"foo.my-thing",
	})
end

os.exit(lu.LuaUnit.run())
