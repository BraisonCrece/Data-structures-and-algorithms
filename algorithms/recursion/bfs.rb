def bfs(head: , needle: )
  queue = [head]
  until queue.empty? do
    current = queue.shift

    return true if current.value == needle

    queue << current.left if current.left
    queue << current.right if current.right
  end
  # if we don't find the value
  false
end
