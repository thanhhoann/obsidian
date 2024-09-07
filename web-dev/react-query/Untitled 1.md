```tsx
import { useQuery, useMutation, useQueryClient } from 'react-query';
import axios from 'axios';

// Fetch post reactions and user's reaction status
const fetchPostReaction = async (postId) => {
  const response = await axios.get(`/api/posts/${postId}/reactions`);
  return response.data; // { reactionCount: number, userHasReacted: boolean }
};

// Handle "Love" reaction
const lovePost = async (postId) => {
  const response = await axios.post(`/api/posts/${postId}/love`);
  return response.data;
};

function Post({ postId }) {
  const queryClient = useQueryClient();

  // Fetch the post reactions and user's reaction status
  const { data, error, isLoading } = useQuery(['postReactions', postId], () => fetchPostReaction(postId));

  // Mutation to "love" a post
  const mutation = useMutation(() => lovePost(postId), {
    onMutate: async () => {
      // Cancel any outgoing refetches for the query
      await queryClient.cancelQueries(['postReactions', postId]);

      // Snapshot the previous reactions and user status
      const previousData = queryClient.getQueryData(['postReactions', postId]);

      // Optimistically update reaction count and mark user as reacted
      queryClient.setQueryData(['postReactions', postId], (oldData) => ({
        ...oldData,
        reactionCount: oldData.reactionCount + 1,
        userHasReacted: true, // Mark user as reacted
      }));

      return { previousData };
    },
    onError: (err, variables, context) => {
      // Rollback on error
      queryClient.setQueryData(['postReactions', postId], context.previousData);
    },
    onSettled: () => {
      // Refetch the latest data from the server
      queryClient.invalidateQueries(['postReactions', postId]);
    },
  });

  if (isLoading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;

  const { reactionCount, userHasReacted } = data;

  return (
    <div>
      <div>Reactions: {reactionCount}</div>
      <button 
        onClick={() => mutation.mutate()} 
        disabled={userHasReacted} // Disable if user has already reacted
      >
        {userHasReacted ? 'You Loved This' : 'Love'}
      </button>
    </div>
  );
}
```
