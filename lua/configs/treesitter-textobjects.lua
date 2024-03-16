local options = {
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = { query = "@function.outer" },
				["if"] = { query = "@function.inner" },

				["am"] = { query = "@call.outer" },
				["im"] = { query = "@call.inner" },

				["aC"] = { query = "@class.outer" },
				["iC"] = { query = "@class.inner" },

				["ac"] = { query = "@conditional.outer" },
				["ic"] = { query = "@conditional.inner" },

				["ae"] = { query = "@block.outer" },
				["ie"] = { query = "@block.inner" },

				["al"] = { query = "@loop.outer" },
				["il"] = { query = "@loop.inner" },

				["is"] = { query = "@statement.inner" },
				["as"] = { query = "@statement.outer" },

				["ad"] = { query = "@comment.outer" },

				["aa"] = { query = "@parameter.outer" },
				["ia"] = { query = "@parameter.inner" },

				["a."] = { query = "@property.outer" },
				["i."] = { query = "@property.inner" },
				["l."] = { query = "@property.lhs" }, -- Select left part of an object property
				["r."] = { query = "@property.rhs" }, -- Select right part of an object property

				["a="] = { query = "@assignment.outer" },
				["i="] = { query = "@assignment.inner" },
				["l="] = { query = "@assignment.lhs" },
				["r="] = { query = "@assignment.rhs" },
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {},
			goto_next_end = {
				["]M"] = { query = "@function.outer" },
				["]["] = { query = "@class.outer" },
			},
			goto_previous_start = {
				["[m"] = { query = "@function.outer" },
				["[["] = { query = "@class.outer" },
			},
			goto_previous_end = {
				["[M"] = { query = "@function.outer" },
				["[]"] = { query = "@class.outer" },
			},
			goto_next_start = {
				["]m"] = { query = "@function.outer" },
				["]f"] = { query = "@call.outer" },
				["]c"] = { query = "@class.outer" },
				["]i"] = { query = "@conditional.outer" },
				["]l"] = { query = "@loop.outer" },
			},
			goto_next_end = {
				["]F"] = { query = "@call.outer" },
				["]M"] = { query = "@function.outer" },
				["]C"] = { query = "@class.outer" },
				["]I"] = { query = "@conditional.outer" },
				["]L"] = { query = "@loop.outer" },
			},
			goto_previous_start = {
				["[f"] = { query = "@call.outer" },
				["[m"] = { query = "@function.outer" },
				["[c"] = { query = "@class.outer" },
				["[i"] = { query = "@conditional.outer" },
				["[l"] = { query = "@loop.outer" },
			},
			goto_previous_end = {
				["[F"] = { query = "@call.outer" },
				["[M"] = { query = "@function.outer" },
				["[C"] = { query = "@class.outer" },
				["[I"] = { query = "@conditional.outer" },
				["[L"] = { query = "@loop.outer" },
			},
		},
	},
	swap = {
		enable = true,
		swap_next = {
			["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
			["<leader>n:"] = "@property.outer", -- swap object property with next
			["<leader>nm"] = "@function.outer", -- swap function with next
		},
		swap_previous = {
			["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
			["<leader>p:"] = "@property.outer", -- swap object property with prev
			["<leader>pm"] = "@function.outer", -- swap function with previous
		},
	},
}

return options
