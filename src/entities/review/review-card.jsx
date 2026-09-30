import { StarIcon } from 'shared/ui/icon';
export const ReviewCard = ({ review }) => (
  <div style={{ background: 'white', borderRadius: 12, padding: 20, border: '1px solid #F0F0F0' }}>
    <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginBottom: 12 }}>
      <div style={{ width: 40, height: 40, borderRadius: '50%', background: '#E5E5E5' }} />
      <div style={{ fontWeight: 700, fontSize: 14 }}>{review.author}</div>
    </div>
    <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
      {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= review.rating} size={14} />)}
    </div>
    <p style={{ fontSize: 13, color: '#8B8B8B', lineHeight: 1.6 }}>{review.text}</p>
  </div>
);
