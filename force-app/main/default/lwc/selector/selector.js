// import { api, LightningElement, wire } from 'lwc';
// import Name from '@salesforce/schema/Account.Name';
// import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
// const fields = [Name]

// export default class Selector extends LightningElement {
//     selectedProductId;
//     Name = userName;
//     @wire(getRecord, { recordId: '$userName', fields})
//     user; 

//     get name() {
//         return getFieldValue(this.user.data, Name);
//       }

//     handleProductSelected(evt) {
//         this.selectedProductId = evt.detail;
//     }
// }


import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';
const fields = [NAME_FIELD];
export default class Selector extends LightningElement {
  selectedProductId;
  handleProductSelected(evt) {
    this.selectedProductId = evt.detail;
  }
  userId = Id;
  @wire(getRecord, { recordId: '$userId', fields })
  user;
  get name() {
    return getFieldValue(this.user.data, NAME_FIELD);
  }
}