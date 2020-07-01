const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

const firebase = admin.firestore();
const settings = {timestampeInSnapshots: true};
firebase.settings(settings);

const stripe = require("stripe")(functions.config().stripe.token);

exports.addStripeSource = functions.firestore.document('cards/{userid}/tokens/{tokenid}')
 .onCreate(async (tokenSnap, context) => {
     var customer;
     const data = tokenSnap.after.data();
     if(data === null) {
         return null;
     }
     const token = data.tokenId;
     const snapshot = await firestore.collection('cards').doc(context.params.userId).get();
     const customerId = snapshot.data().custId;
     const customerEmail = snapshot.data().email;

     if(customerId === 'new') {
         customer = await stripe.customers.create({
             email: customerEmail,
             source: token
         });
    
         firestore.collection('cards').doc(context.params.userId).update({
             customerId: customer.id
         });
     }
     else {
         customer = await stripe.customers.retrieve(customerId);
     }

     const customerSource = customer.sources.data[0];

     return first.collection('cards').doc(context.params.userId)
    .collection('sources').doc(customerSource.card.fingerprint).set(customerSource, {merge: true});
 })