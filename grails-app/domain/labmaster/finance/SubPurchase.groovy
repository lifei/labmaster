package labmaster.finance
import labmaster.item.StandardItem
import labmaster.item.Reagent

class SubPurchase {

    /** 物品 */
    StandardItem item

    /** 试剂 */
    Reagent reagent

    /** name */
    String name

    Integer type

    /** 金额 */
    Float money

    /** 数量 */
    Float amount

    /** 采购 */
    static belongsTo = [purchase:Purchase]

    static constraints = {
        name(nullable:true,blank:true)
        item(nullable:true,blank:true)
        reagent(nullable:true,blank:true)
        money(min:0.0)
        amount(min:0.0)
        purchase(nullable:false, blank:false)
        type(validator:{
            val, obj ->
            if(!val)return 'blank'
            if(val == 0 && !obj.item) {// 物品
                return 'emptyItem'
            }
            if(val == 1 && !obj.reagent) {// 物品
                return 'emptyReagent'
            }
            if(val == 2 && (!obj.name || obj.name.size() == 0)) {// 物品
                return 'emptyName'
            }
        })
    }
}
