class MaxHeap
  def initialize(elements = [])
    @heap = elements
    (@heap.size / 2 - 1).downto(0) { |i| bubble_down(i) }
  end

  def empty?
    @heap.empty?
  end

  def max
    @heap[0]
  end

  def push(val)
    @heap << val
    bubble_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?
    max_val = @heap[0]

    last_val = @heap.pop
    unless @heap.empty?
      @heap[0] = last_val
      bubble_down(0)
    end

    max_val
  end

  private

  def bubble_up(index)
    parent_idx = (index - 1) / 2
    return if index <= 0 || @heap[parent_idx] >= @heap[index]

    @heap[parent_idx], @heap[index] = @heap[index], @heap[parent_idx]
    bubble_up(parent_idx)
  end

  def bubble_down(index)
    child_idx = 2 * index + 1
    return if child_idx >= @heap.size

    right_idx = child_idx + 1
    if right_idx < @heap.size && @heap[right_idx] > @heap[child_idx]
      child_idx = right_idx
    end

    return if @heap[index] >= @heap[child_idx]

    @heap[index], @heap[child_idx] = @heap[child_idx], @heap[index]
    bubble_down(child_idx)
  end
end

def solve
  input = ARGF.read.split.map(&:to_i)
  idx = 0

  t = input[idx]
  idx += 1

  t.times do
    n = input[idx]
    m = input[idx + 1]
    idx += 2

    a = MaxHeap.new(input[idx, n])
    idx += n
    b = MaxHeap.new(input[idx, m])
    idx += m

    turn = 0

    loop do
      if a.empty?
        puts 'Bob'
        break
      end
      if b.empty?
        puts 'Alice'
        break
      end

      x = a.max
      y = b.max

      if turn == 0
        if x < y
          b.pop
          b.push(y - x)
        else
          b.pop
        end
        turn = 1
      else
        # Bob's turn
        if x > y
          a.pop
          a.push(x - y)
        else
          a.pop
        end
        turn = 0
      end
    end
  end
end

solve
