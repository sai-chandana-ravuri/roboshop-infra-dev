variable "components" {
    default = {
        #this is attaching to backend_alb, these are all backend components.
        catalogue = {
            rule_priority: 10 
        }
        cart = {
            rule_priority: 20
        }
        shipping = {
            rule_priority: 30
        }
        user = {
            rule_priority: 40 
        }
        payment = {
            rule_priority: 50
        }
        #this is attaching to frontend_alb, there is only one component.
        frontend = {
            rule_priority: 10 
        }
    }
}