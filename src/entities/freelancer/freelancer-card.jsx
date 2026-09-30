import { useNavigate } from 'react-router-dom';
import { StarIcon } from 'shared/ui/icon';
export const FreelancerCard = ({ freelancer }) => {
  const nav = useNavigate();
  return (
    <div className="hoverLift" style={{ background: 'white', borderRadius: 12, padding: 20, border: '1px solid #F0F0F0' }}>
      <div style={{ display: 'flex', gap: 16, alignItems: 'center', marginBottom: 16 }}>
        <img src={freelancer.avatar} alt="" style={{ width: 64, height: 64, borderRadius: '50%' }} />
        <div>
          <div style={{ fontWeight: 700, fontSize: 15, marginBottom: 2 }}>{freelancer.name}</div>
          <div style={{ fontSize: 13, color: '#FBA457', fontWeight: 600, marginBottom: 2 }}>{freelancer.role}</div>
          <div style={{ fontSize: 12, color: '#8B8B8B' }}>Выполнено проектов: {freelancer.projects}</div>
        </div>
      </div>
      <div style={{ display: 'flex', gap: 2, marginBottom: 16 }}>
        {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= freelancer.rating} size={16} />)}
      </div>
      <button onClick={() => nav('/chat')} style={{ width: '100%', padding: 10, background: '#21B349', color: 'white', borderRadius: 8, fontWeight: 600, fontSize: 13, border: 'none', cursor: 'pointer' }}>Написать</button>
    </div>
  );
};
