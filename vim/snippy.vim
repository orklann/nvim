lua <<EOF
require('snippy').setup({
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
        }
    },
})
EOF
