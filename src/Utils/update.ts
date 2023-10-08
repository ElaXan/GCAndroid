import { Listr } from "listr2";
import { ListrEnquirerPromptAdapter } from "@listr2/prompt-adapter-enquirer";
import { APIResponse } from '../../'
import { shell } from "./shell";

export default async function handleUpdate(body: APIResponse) {
    console.log('Update available')
    console.log(`Description: ${body.description}`)
    console.log(`Version: ${body.version}`)
    if (body.changelog.length > 0) {
        console.log('Changelog:')
        body.changelog.forEach((item) => {
            console.log('- ' + item)
        })
    }

    new Listr([
        {
            title: 'Getting you on-board.',
            task: async (ctx, task) => {
                ctx.update = await task.prompt(ListrEnquirerPromptAdapter).run({
                    message: 'Do you want to update GCAndroid?',
                    type: 'Confirm',
                    initial: true
                })
            }
        },
        {
            title: 'Updating GCAndroid',
            skip: (ctx) => !ctx.update,
            task: async (_, task) => {
                return new Promise<void>((resolve, reject) => {
                    shell('npm i -g https://github.com/Score-Inc/GCAndroid', 0, (data) => {
                        if (data !== null) {
                            task.output = `${data}`
                        }
                    }).then(() => {
                        resolve()
                    }).catch((err) => {
                        reject(err)
                    })
                })
            }
        }
    ], {
        concurrent: false,
        renderer: 'default',
        rendererOptions: {
            collapseSubtasks: false
        }
    }).run()
}