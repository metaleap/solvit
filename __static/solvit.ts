import van from '../__yostatic/vanjs/van-1.2.6.js'
const htm = van.tags

import * as yo from './yo-sdk.js'

export function main() {
    const btn_on_click = async () => {
        let name = prompt("Your name?")
        if (name && (name = name.trim())) try {
            const greeting = await yo.api__helloName({ Name: name })
            alert(greeting.Result)
        } catch (err) {
            alert(err)
        }
    }

    van.add(document.body,
        htm.button({
            'type': 'button',
            'onclick': btn_on_click,
        }, "Be greeted"),
    )
}
