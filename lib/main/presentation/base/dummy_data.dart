import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

List<NotificationItemInput> userNotifications = [
  NotificationItemInput(
    amount: "100,000",
    username: 'Aso Ebi',
    createdAt: DateTime.now(),
    image: ProfileIconAssets.profile,
    transaction: TransactionInput(
      type: TransactionType.billSplitter,
      createdAt: DateTime.now(),
      status: TransactionStatus.accepted,
    ),
  ),
  NotificationItemInput(
    amount: "100,000",
    username: 'Aso Ebi',
    createdAt: DateTime.now(),
    image: ProfileIconAssets.profile,
    transaction: TransactionInput(
      type: TransactionType.billSplitter,
      createdAt: DateTime.now(),
      status: TransactionStatus.accepted,
    ),
  ),
  NotificationItemInput(
    amount: "100,000",
    username: 'Aso Ebi',
    createdAt: DateTime.now(),
    image: ProfileIconAssets.profile,
    transaction: TransactionInput(
      type: TransactionType.billSplitter,
      createdAt: DateTime.now(),
      status: TransactionStatus.accepted,
    ),
  ),
  NotificationItemInput(
    amount: "100,000",
    username: 'Aso Ebi',
    createdAt: DateTime.now(),
    image: ProfileIconAssets.profile,
    transaction: TransactionInput(
      type: TransactionType.billSplitter,
      createdAt: DateTime.now(),
      status: TransactionStatus.accepted,
    ),
  ),
  NotificationItemInput(
    amount: "100,000",
    username: 'Aso Ebi',
    createdAt: DateTime.now(),
    image: ProfileIconAssets.profile,
    transaction: TransactionInput(
      type: TransactionType.billSplitter,
      createdAt: DateTime.now(),
      status: TransactionStatus.accepted,
    ),
  ),
  NotificationItemInput(
    amount: "100,000",
    username: 'Aso Ebi',
    createdAt: DateTime.now(),
    image: ProfileIconAssets.profile,
    transaction: TransactionInput(
      type: TransactionType.billSplitter,
      createdAt: DateTime.now(),
      status: TransactionStatus.accepted,
    ),
  ),
  NotificationItemInput(
    amount: "100,000",
    username: 'Aso Ebi',
    createdAt: DateTime.now(),
    image: ProfileIconAssets.profile,
    transaction: TransactionInput(
      type: TransactionType.billSplitter,
      createdAt: DateTime.now(),
      status: TransactionStatus.accepted,
    ),
  ),
  NotificationItemInput(
    amount: "100,000",
    username: 'Aso Ebi',
    createdAt: DateTime.now(),
    image: ProfileIconAssets.profile,
    transaction: TransactionInput(
      type: TransactionType.billSplitter,
      createdAt: DateTime.now(),
      status: TransactionStatus.accepted,
    ),
  ),
];

List<Obligation> obligationsSecureSales = [ 
  Obligation( 
    title: 'Aso ebi', 
    type: ObligationType.delivery,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[1].id, 
    dueDate: DateTime.now() 
  ),
  Obligation(
    title: 'Lace', 
    type: ObligationType.delivery,
    status: ObligationStatus.pending, 
    amount: 10000.00,
     
    binding: users[1].id, 
    dueDate: DateTime.now()
  ),  
  Obligation(
    title: 'bill payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 20000.00, 
     
    // payee: users[1], 
    dueDate: DateTime.now() 
  ),
];

List<Obligation> obligationsBillSplitter = [ 
  Obligation( 
    title: 'bill payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[0].id, 
    dueDate: DateTime.now() 
  ),
  Obligation( 
    title: 'bill payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[1].id, 
    dueDate: DateTime.now() 
  ),
  Obligation(
    title: 'bill payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[2].id, 
    dueDate: DateTime.now() 
  ),  
  Obligation(
    title: 'bill payment', 
    type: ObligationType.payment,
    status: ObligationStatus.paid, 
    amount: 10000.00, 
     
    binding: users[3].id, 
    dueDate: DateTime.now() 
  ),  
  Obligation(
    title: 'bill payment', 
    type: ObligationType.payment,
    status: ObligationStatus.paid, 
    amount: 10000.00, 
     
    binding: users[4].id, 
    dueDate: DateTime.now() 
  ),  
  // Obligation( 
  //   title: 'bill payment', 
  //   type: ObligationType.payout, 
  //   status: ObligationStatus.pending, 
  //   amount: 50000.00, 
  //    
  //   payee: users[5], 
  //   dueDate: DateTime.now() 
  // ),
];

List<Obligation> obligationsGroup = [ 
  //First Month
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 5000.00, 
     
    binding: users[0].id, 
    dueDate: DateTime(2024, 10, 5),
  ), 
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 5000.00, 
     
    binding: users[1].id, 
    dueDate: DateTime(2024, 10, 5),
  ), 
  Obligation(
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 5000.00, 
     
    binding: users[2].id, 
    dueDate: DateTime(2024, 10, 5),
  ), 
  Obligation(
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 5000.00, 
     
    binding: users[3].id, 
    dueDate: DateTime(2024, 10, 5),
  ), 

  //2nd Month 
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 5000.00, 
     
    binding: users[0].id, 
    dueDate: DateTime(2024, 11, 5),
  ),
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 5000.00, 
     
    binding: users[1].id, 
    dueDate: DateTime(2024, 11, 5),
  ),
  Obligation(
    title: 'group payment', 
    type: ObligationType.payment, 
    status: ObligationStatus.paid, 
    amount: 5000.00, 
     
    binding: users[2].id, 
    dueDate: DateTime(2024, 11, 5), 
  ),  
  Obligation(
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.paid, 
    amount: 5000.00, 
     
    binding: users[3].id, 
    dueDate: DateTime(2024, 11, 5),
  ),   
];

List<Obligation> obligationsAjo = [ 
  //1st Month
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment, 
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[0].id, 
    dueDate: DateTime(2024, 10, 10)
  ),
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment, 
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[1].id, 
    dueDate: DateTime(2024, 10, 10)
  ),
  Obligation(
    title: 'group payment', 
    type: ObligationType.payment, 
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[2].id, 
    dueDate: DateTime(2024, 10, 10)
  ), 

  //2nd Month
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[0].id, 
    dueDate: DateTime(2024, 11, 10)
  ),
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[1].id, 
    dueDate: DateTime(2024, 11, 10)
  ),
  Obligation(
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[2].id, 
    dueDate: DateTime(2024, 11, 10)
  ),  

  //3rd Month
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[0].id, 
    dueDate: DateTime(2024, 12, 10)
  ),
  Obligation( 
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[1].id, 
    dueDate: DateTime(2024, 12, 10)
  ),
  Obligation(
    title: 'group payment', 
    type: ObligationType.payment,
    status: ObligationStatus.pending, 
    amount: 10000.00, 
     
    binding: users[2].id, 
    dueDate: DateTime(2024, 12, 10)
  ),


  Obligation(
    title: 'group payment', 
    type: ObligationType.payout,
    status: ObligationStatus.paid, 
    amount: 30000.00, 
     
    // payee: users[0], 
    dueDate: DateTime(2024, 10, 10)
  ),  
  Obligation(
    title: 'group payment', 
    type: ObligationType.payout, 
    status: ObligationStatus.pending, 
    amount: 30000.00, 
     
    // payee: users[1], 
    dueDate: DateTime(2024, 11, 10)
  ),  
  Obligation(
    title: 'group payment', 
    type: ObligationType.payout, 
    status: ObligationStatus.pending, 
    amount: 30000.00, 
     
    // payee: users[2].id, 
    dueDate: DateTime(2024, 12, 10)
  ),  
];

List<Transaction> transactions = [
  Transaction(
    title: "Aso ebi purchase from @sarah_clothings", 
    total: 20000.00, 
    dateCreated: DateTime.now(), 
    expiryDate: DateTime.now(), 
    type: TransactionType.secureSales, 
    status: TransactionStatus.pending, 
    percentageComplete: 0, 
    members : [
      users[0], 
      users[1], 
    ],
    obligations: obligationsSecureSales
  ),
 
  Transaction(
    title: "Bet with Nelson ",
    total: 50000.00,
    dateCreated: DateTime.now(),
    expiryDate: DateTime.now().add(const Duration(days: 10, hours: 5, minutes: 16)),
    type: TransactionType.betsWagers,
    mediation: Mediation(
      user: 2, 
      mediator: 3, 
      binding: 4,
      sourceType: 'web',
      details: "Man United is better than Arsenal", 
      web: 'https://solidslab.ca/publications/' 
    ),
    status: TransactionStatus.pending,
    percentageComplete: 0,
    members : [
      users[0],
      users[1]
    ],
    obligations: []
  ),
 
  Transaction(
    title: "Team bonding dinner",
    total: 50000.00,
    dateCreated: DateTime.now(),
    expiryDate: DateTime.now(),
    type: TransactionType.billSplitter,
    status: TransactionStatus.pending,
    percentageComplete: 0,
    members : users,
    obligations: obligationsBillSplitter
  ),
 
  Transaction(
    title: "Group Saving with family",
    total: 40000.00,
    dateCreated: DateTime(2024, 10, 5),
    expiryDate: DateTime(2024, 11, 5),
    type: TransactionType.groupGoals,
    status: TransactionStatus.pending,
    percentageComplete: 0,
    members : [
      users[0],
      users[1],
      users[2],
      users[3],
    ],
    obligations: obligationsGroup
  ),
  
  Transaction(
    title: "Ajo with family and friends ",
    total: 30000.00,
    dateCreated: DateTime(2024, 10, 10),
    expiryDate: DateTime(2024, 12, 10),
    type: TransactionType.moneyPool,
    status: TransactionStatus.pending,
    percentageComplete: 0,
    members : [
      users[0],
      users[1],
      users[2],
    ],
    obligations: obligationsAjo
  ),

];

List<User> users = const [
  User(
    firstName: "Tolu",
    lastName: "Nelson",
    profileImage: ProfileIconAssets.avatar,
    email: "tolunelson@gmail.com",
    admin: false,
    mediator: false,
    online: false,
    fcmToken: '1234-2345-2345-3456',
    bvn: '245643665',
    account: Account(
      accountNumber: 345567899,
      name: "Polaris Trust Account", 
      balance: 10000      
    )
  ),
  User(
    firstName: "Sarah Joe",
    lastName: "Nelson",
    profileImage: ProfileIconAssets.avatar,
    email: "sarahdoe@gmail.com",
    admin: false,
    mediator: false,
    online: false,
    fcmToken: '1234-2345-2345-3456',
    bvn: '245643665',
    account: Account(
      accountNumber: 345567899,
      name: "Polaris Trust Account",   
      balance: 10000    
    )
  ),
  User(
    firstName: "Loni",
    lastName: "Nelson",
    profileImage: ProfileIconAssets.avatar,
    email: "loninelson@gmail.com",
    admin: false,
    mediator: false,
    online: false,
    fcmToken: '1234-2345-2345-3456',
    bvn: '245643665',
    account: Account(
      accountNumber: 345567899,
      name: "Polaris Trust Account", 
      balance: 10000      
    )
  ),
  User(
    firstName: "Amaka",
    lastName: "West",
    profileImage: ProfileIconAssets.avatar,
    email: "amakawest@gmail.com",
    admin: false,
    mediator: false,
    online: false,
    fcmToken: '1234-2345-2345-3456',
    bvn: '245643665',
    account: Account(
      accountNumber: 345567899,
      name: "Polaris Trust Account",    
      balance: 10000   
    )
  ),
  User(
    firstName: "John",
    lastName: "Walker",
    profileImage: ProfileIconAssets.avatar,
    email: "johnwalker@gmail.com",
    admin: false,
    mediator: false,
    online: false,
    fcmToken: '1234-2345-2345-3456',
    bvn: '245643665',
    account: Account(
      accountNumber: 345567899,
      name: "Polaris Trust Account",    
      balance: 10000   
    )
  ),
  User(
    firstName: "John",
    lastName: "Talker",
    profileImage: ProfileIconAssets.avatar,
    email: "johntalker@gmail.com",
    admin: false,
    mediator: false,
    online: false,
    fcmToken: '1234-2345-2345-3456',
    bvn: '245643665',
    account: Account(
      accountNumber: 345567899,
      name: "Polaris Trust Account",      
      balance: 10000 
    )
  ),
];

List<WebsiteInput> websiteSearchResult = [
  WebsiteInput(
    url: "https://www.eurosport.com", 
    title: "Eurosport",
  ),
  WebsiteInput(
    url: "https://www.eurosport.com", 
    title: "Eurosport",
  ),
  WebsiteInput(
    url: "https://www.eurosport.com", 
    title: "Eurosport",
  ),
  WebsiteInput(
    url: "https://www.eurosport.com", 
    title: "Eurosport",
  ),
  WebsiteInput(
    url: "https://www.eurosport.com", 
    title: "Eurosport",
  ),
  WebsiteInput(
    url: "https://www.eurosport.com", 
    title: "Eurosport",
  ),
  WebsiteInput(
    url: "https://www.eurosport.com", 
    title: "Eurosport",
  ),
  WebsiteInput(
    url: "https://www.eurosport.com", 
    title: "Eurosport",
  ),
];