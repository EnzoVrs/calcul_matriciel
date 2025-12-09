-- Petit module de calcul matriciel en Lua
-- Contient des fonctions basiques: création, addition, multiplication, transpose, affichage

local M = {}

local function shape(A)
	return #A, #A[1]
end

local function new_matrix(r, c, fill)
	local T = {}
	for i = 1, r do
		T[i] = {}
		for j = 1, c do
			T[i][j] = fill or 0
		end
	end
	return T
end

local function add(A, B)
	local rA, cA = shape(A)
	local rB, cB = shape(B)
	assert(rA == rB and cA == cB, "Dimensions must match for addition")
	local R = new_matrix(rA, cA, 0)
	for i = 1, rA do
		for j = 1, cA do
			R[i][j] = A[i][j] + B[i][j]
		end
	end
	return R
end

local function multiply(A, B)
	local rA, cA = shape(A)
	local rB, cB = shape(B)
	assert(cA == rB, "A.columns must equal B.rows for multiplication")
	local R = new_matrix(rA, cB, 0)
	for i = 1, rA do
		for j = 1, cB do
			local s = 0
			for k = 1, cA do
				s = s + A[i][k] * B[k][j]
			end
			R[i][j] = s
		end
	end
	return R
end

local function transpose(A)
	local r, c = shape(A)
	local T = new_matrix(c, r, 0)
	for i = 1, r do
		for j = 1, c do
			T[j][i] = A[i][j]
		end
	end
	return T
end

local function scalar_multiply(A, s)
	local r, c = shape(A)
	local R = new_matrix(r, c, 0)
	for i = 1, r do
		for j = 1, c do
			R[i][j] = A[i][j] * s
		end
	end
	return R
end

local function pretty_print(A)
	for i = 1, #A do
		local row = {}
		for j = 1, #A[1] do
			table.insert(row, string.format("%g", A[i][j]))
		end
		print(table.concat(row, "\t"))
	end
end

-- Fonction demandée: effectue un calcul matriciel dans la fonction
-- Exemple: calcule A * B + C (avec vérification des dimensions)
local function matrix_calc(A, B, C)
	-- vérifie multiplication possible
	local rA, cA = shape(A)
	local rB, cB = shape(B)
	local rC, cC = shape(C)
	assert(cA == rB, "A.columns must equal B.rows for A*B")
	assert(rA == rC and cB == cC, "Result and C must have same dimensions for addition")

	local prod = multiply(A, B)
	local sum = add(prod, C)
	return sum
end

-- Exemples d'utilisation
local A = { {1, 2}, {3, 4} }
local B = { {5, 6}, {7, 8} }
local C = { {1, 1}, {1, 1} }

local result = matrix_calc(A, B, C)
print("Result of A * B + C:")
pretty_print(result)

-- Expose local utilitaires si besoin (optionnel)
M.new = new_matrix
M.add = add
M.multiply = multiply
M.transpose = transpose
M.scalar_multiply = scalar_multiply
M.print = pretty_print
M.matrix_calc = matrix_calc

return M
