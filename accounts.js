export default {
    "liquidator": [{
        adr: process.env.LIQUIDATOR_ADDRESS,
        ks: process.env.LIQUIDATOR_PRIVATE_KEY
    }],
    "rollover": [{
        adr: process.env.ROLLOVER_ADDRESS,
        ks: process.env.ROLLOVER_PRIVATE_KEY
    }],
    "arbitrage": [{
        adr: process.env.ARBITRAGE_ADDRESS,
        ks: process.env.ARBITRAGE_PRIVATE_KEY
    }],
}