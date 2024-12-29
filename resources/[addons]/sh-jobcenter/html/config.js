const jobList = [
    {
        id: 1,
        name: 'reporter', // name of job
        label: 'Reporter',
        pay: '$10',
        description: `
            <strong>Reporters</strong> gather and analyze information, conduct interviews, and write news stories. 
            Topics include politics, business, sports, and entertainment. Strong communication skills are essential.
        `,
        image: 'imgs/reporter.png',
        tags: ['Media', 'Communication', 'Writing'],
        recommended: true
    },
    {
        id: 2,
        name: 'farmer', // name of job
        label: 'Farmer',
        pay: '$10',
        description: `
            <strong>Farmers</strong> manage agricultural operations including crops and livestock. 
            Responsibilities include planting, cultivating, and harvesting. Knowledge of modern farming techniques is beneficial.
        `,
        image: 'imgs/farmer.png',
        tags: ['Agriculture', 'Livestock', 'Crops'],
        recommended: false
    },
    {
        id: 3,
        name: 'garbage', // name of job
        label: 'Garbage Collector',
        pay: '$10',
        description: `
            <strong>Garbage Collectors</strong> collect and dispose of waste materials. 
            Ensure timely and efficient waste collection. Physical fitness and attention to safety regulations are important.
        `,
        image: 'imgs/garbage.png',
        tags: ['Waste Management', 'Sanitation', 'Recycling'],
        recommended: false
    },
    {
        id: 4,
        name: 'trucker', // name of job
        label: 'Trucker',
        pay: '$10',
        description: `
            <strong>Truckers</strong> transport goods over long distances, ensuring timely and safe delivery. 
            Operate and maintain large vehicles and comply with traffic laws.
        `,
        image: 'imgs/trucker.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 5,
        name: 'taxi', // name of job
        label: 'taxi',
        pay: '$10',
        description: `
            <strong>taxi</strong>
        `,
        image: 'imgs/taxi.png',
        tags: ['Maintenance', 'Repair', 'Technical'],
        recommended: false
    },
    {
        id: 6,
        name: 'tow', // name of job
        label: 'tow',
        pay: '$10',
        description: `
            <strong>tow</strong>
        `,
        image: 'imgs/tow.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 7,
        name: 'bus', // name of job
        label: 'bus',
        pay: '$10',
        description: `
            <strong>bus</strong>
        `,
        image: 'imgs/bus.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 8,
        name: 'hotdog', // name of job
        label: 'hotdog',
        pay: '$10',
        description: `
            <strong>hotdog</strong>
        `,
        image: 'imgs/hotdog.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 9,
        name: 'Construction', // name of job
        label: 'Construction',
        pay: '$10',
        description: `
            <strong>Construction</strong>
        `,
        image: 'imgs/Construction.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 10,
        name: 'butcher', // name of job
        label: 'butcher',
        pay: '$10',
        description: `
            <strong>butcher</strong>
        `,
        image: 'imgs/butcher.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 11,
        name: 'lumberjack', // name of job
        label: 'lumberjack',
        pay: '$10',
        description: `
            <strong>lumberjack</strong>
        `,
        image: 'imgs/lumberjack.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 12,
        name: 'airport', // name of job
        label: 'airport',
        pay: '$10',
        description: `
            <strong>airport</strong>
        `,
        image: 'imgs/airport.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 13,
        name: 'mining', // name of job
        label: 'mining',
        pay: '$10',
        description: `
            <strong>mining</strong>
        `,
        image: 'imgs/mining.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },
    {
        id: 13,
        name: 'taco', // name of job
        label: 'taco',
        pay: '$10',
        description: `
            <strong>taco</strong>
        `,
        image: 'imgs/taco.png',
        tags: ['Transportation', 'Logistics', 'Delivery'],
        recommended: false
    },    
];

const texts = {
    jobCenterTitle: 'Job Center',
    closeButton: '✖',
    applyButton: 'Sign Up',
    applicationSubmittedTitle: 'Application Submitted!',
    applicationSubmittedMessage: (jobName, jobPay) => `You have signed for the position of ${jobName} with a pay of ${jobPay}$.`
};
