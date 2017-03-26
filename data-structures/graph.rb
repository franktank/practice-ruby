require './singly-linked-list'
require 'set'

# Undirected Graph
class Graph
    attr_reader :vertices, :edges, :adj
    def initialize(v=8)
        @vertices = v
        @edges = 0
        @adj = Array.new(v) {Set.new}
    end
    
    def add_edge(v, w)
        @adj[v].add(w) # @adj[v] << w
        @adj[w].add(v) # @adj[w] << v
        @edges += 1
    end
    
    def to_s
        @adj.each_with_index do |vertex, i|
            vertex.each do |adj|
                p "Vertex: #{i}, Adjacent: #{adj}"
            end
        end
    end
end

g = Graph.new
g.add_edge(1, 2)
g.add_edge(1, 3)
g.to_s
p g.vertices
p g.edges

# g = Graph, sv = starting vertex
# TODO: track distance
class DepthFirstPaths
    def initialize(g=nil, sv=0)
        @graph = g
        @start = sv
        @marked = Array.new(g.vertices)
        @edge_to = Array.new(g.vertices) # edge_to[a vertex] = from starting vertex 
        dfs(@graph, @start)
    end
    
    def dfs(g, sv)
        @marked[sv] = true
        g.adj[sv].each do |vertex|
            if !@marked[vertex] 
                @edge_to[vertex] = sv
                dfs(g, vertex)
            end
        end
    end
    
    def has_path_to?(v)
        @marked[v]
    end
    
    def path_to(v)
        s = []
        if has_path_to?(v)
            curr = v
            while curr != @start
                s << curr
                curr = @edge_to[curr]                
            end
            s << curr
        end
        s.reverse
    end
end

gdfs = Graph.new(6)
gdfs.add_edge(0, 2)
gdfs.add_edge(0, 1)
gdfs.add_edge(0, 5)
gdfs.add_edge(1, 2)
gdfs.add_edge(2, 3)
gdfs.add_edge(2, 4)
gdfs.add_edge(3, 4)
gdfs.add_edge(3, 5)
d = DepthFirstPaths.new(gdfs, 0)
p d.path_to(1)
p d.path_to(4)

class DFPTree
    # Assume start on root
    def initialize(bst_node)
        @root = bst_node
        @marked = Array.new(bst_node.size)
        @edge_to = Array.new(bst_node.size)
        dfs(@root)
    end
    # DFS Preorder Traversal
    def dfspo(t)
        if t == nil
            return
        end
        
        @marked[t.key] = true
        p "Key: #{t.key}, Value: #{t.value}"
        @edge_to[t.key.left] = t.key
        dfspo(t.left)
        @edge_to[t.key.right] = t.key
        dfspo(t.right)
    end
    
    def has_path_to?(v)
        @marked[v]
    end
    
    def path_to(v)
        s = []
        if has_path_to?(v)
            while v != @root.key
                s << v
                v = edge_to[v]
            end
            s << v
        end
        s.reverse
    end
end

class BreadthFirstPaths
    def initialize(g, sv=0)
        @graph = g
        @start = sv
        @edge_to = Array.new(g.vertices)
        @distance = Array.new(g.vertices)
        @marked = Array.new(g.vertices)
        bfs(g, sv)
    end
    
    def bfs(g, sv)
        @distance[sv] = 0
        q = Queue.new
        q.enq(sv)
        while !q.empty?
            u = q.deq
            @marked[u] = true
            g.adj[u].each do |vertex|
                if !@marked[vertex]
                    @distance[vertex] = @distance[u] + 1
                    @edge_to[vertex] = u
                    q.enq(vertex)
                end
            end
        end
    end
    
    def has_path_to?(v)
        @marked[v]
    end
    
    def distance_to(v)
        @distance[v]
    end
    
    def path_to(v)
        s = []
        if has_path_to?(v)
            while v != @start
                s << v
                v = @edge_to[v]
            end
            s << v
        end
        s.reverse
    end
end

bfs = BreadthFirstPaths.new(gdfs, 0)
p bfs.path_to(4)
p bfs.distance_to(4)
p bfs.path_to(2)
p bfs.distance_to(2)

class BFSTree
    def initialize(bst_node)
        @root = bst_node
        @edge_to = Array.new(bst_node.size)
        @marked = Array.new(bst_node.size) # Do I need this?
        @distance = Array.new(bst_node.size)
        level_order(bst_node)
    end
    
    def level_order(x)
        # do like BFS for graphs
        q = Queue.new
        @distance[x.key] = 0
        q.enq(x)
        # Do I need marked since its a BST?
        while !q.empty?
            u = q.deq
            if u.left
                q.enq(u.left)
                @distance[u.left.key] = @distance[u.key] + 1
                @edge_to[u.left.key] = u.key
            end
            if u.right
                q.enq(u.right)
                @distance[u.right.key] = @distance[u.key] + 1
                @edge_to[u.right.key] = u.key
            end
        end
    end
end
# Use stack for preorder traversal (DFS)