import { useNavigate } from 'react-router-dom';
export const WorkCard = ({ work, variant, onOrder }) => {
  const nav = useNavigate();
  const isHL = variant === 'highlight';
  return (
    <div className="hoverLift" style={{ background: 'white', borderRadius: 12, padding: 24, border: isHL ? '2px solid #21B349' : '1px solid #F0F0F0' }}>
      <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginBottom: 12 }}>
        <img src={work.avatar} alt="" style={{ width: 40, height: 40, borderRadius: '50%' }} />
        <div style={{ fontSize: 13, color: '#8B8B8B' }}>{work.author}</div>
      </div>
      <div style={{ fontSize: 16, fontWeight: 700, marginBottom: 8, minHeight: 44, lineHeight: 1.4 }}>{work.title}</div>
      <p style={{ fontSize: 13, color: '#8B8B8B', lineHeight: 1.6, marginBottom: 20, minHeight: 60 }}>{work.desc}</p>
      <button onClick={onOrder} style={{ width: '100%', padding: 10, border: '1.5px solid #21B349', color: '#21B349', borderRadius: 8, fontWeight: 600, fontSize: 13, background: 'white', cursor: 'pointer' }}>Посмотреть</button>
    </div>
  );
};
