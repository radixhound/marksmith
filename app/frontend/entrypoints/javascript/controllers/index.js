import { application } from "./application"

import MarksmithController from "./marksmith_controller"
import ListContinuationController from "./list_continuation_controller"
// import MarksmithController from "./../../../../../app/assets/builds/marksmith.esm.js"
// console.log(MarksmithController)

application.register("marksmith", MarksmithController)
application.register("list-continuation", ListContinuationController)
