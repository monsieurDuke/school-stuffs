peta = {'A':set(['B']),
		'B':set(['C','A']),
		'C':set(['H','B','I','D']),
		'D':set(['C','E','H','F']),
		'E':set(['D']),
		'F':set(['D','G']),
		'G':set(['F','H']),
		'H':set(['L','C','G','D']),
		'I':set(['C','J','K']),
		'J':set(['I']),
		'K':set(['L','I']),
		'L':set(['K','H'])}

def dfs_lintasan_terpendek(graph, mulai, goal):
	explored = []
	stack = [[mulai]]

	if mulai == goal:
		return "Awal adalah Tujuan"
	while stack:
		jalur = stack.pop(-1)
		node = jalur[-1]

		if node not in explored:
			neighbours = graph[node]
			for neighbour in neighbours:
				jalur_baru = list(jalur)
				jalur_baru.append(neighbour)
				stack.append(jalur_baru)
				if neighbour == goal:
					return jalur_baru
			explored.append(node)
	return "Node yang dipilih tidak ada"

awal = input("Masukan titik awal  : ")
tujuan = input("Masukan titik akhir : ")
print(dfs_lintasan_terpendek(peta, awal, tujuan))