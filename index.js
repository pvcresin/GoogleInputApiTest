const div = document.querySelector('div')

const tree = jsonTree.create({}, div)

const input = document.querySelector('input')

input.addEventListener('keyup', async e => {
	const t = e.target.value.trim()
	console.log(t)

	const json = t.length ? await convert(e.target.value) : {}
	tree.loadData(json)
})

const convert = text => {
	const url = `http://www.google.com/transliterate?langpair=ja-Hira|ja&text=${text}`

	return fetch(url).then(res => res.json())
}
